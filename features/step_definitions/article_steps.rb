
Given /the following articles are published/ do |table|
  table.hashes.each do |article|
    visit '/admin/content/new'
    article.each {|k,v| step "I fill in \"article[#{k}]\" with \"#{v}\""}
    click_button('Publish')
  end
end


Given /I publish the following article:/ do |table|
  article = table.hashes.first
  article.each {|k,v| step "I fill in \"article[#{k}]\" with \"#{v}\""}
end

Then /I should see the merge article's form/ do
  step 'I should see "Article Id:"'
  step 'I should see "Merge"'
end

Given /I submit the merge article's form with (.*) id/ do |article_title|
  article_id = Article.find_by_title(article_title).id
  step "I fill in \"merge_with\" with \"#{article_id}\""
  click_button("Merge")
end