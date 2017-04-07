require 'rails_helper'

feature 'Counter values', js: true do
    scenario 'test everythings' do
        visit todos_path

        fill_in 'todo_title', with: 'Be fast'
        page.execute_script("$('form').submit()")
        sleep(2)
        expect(page.find(:css, 'span#todo-count').text).to eq '1'

        fill_in 'todo_title', with: 'Be kind'
        page.execute_script("$('form').submit()")
        sleep(2)
        expect(page.find(:css, 'span#todo-count').text).to eq '2'

        fill_in 'todo_title', with: 'Be programmer'
        page.execute_script("$('form').submit()")

        sleep(2)
        expect(page.find(:css, 'span#todo-count').text).to eq '3'
        expect(page.find(:css, 'span#total-count').text).to eq '3'
        check('todo-1')
        sleep(1)
        expect(page.find(:css, 'span#completed-count').text).to eq '1'
        check('todo-2')
        sleep(1)
        expect(page.find(:css, 'span#completed-count').text).to eq '2'

        expect(page.find(:css, 'span#todo-count').text).to eq '1'

        click_link("clean-up")

        sleep(1)

        expect(page.find(:css, 'span#total-count').text).to eq '1'
    end
end
