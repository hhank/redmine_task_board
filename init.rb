require 'redmine'

Redmine::Plugin.register :redmine_task_board do
  name 'Redmine Task Board plugin'
  author 'Chris Rosser'
  description 'Provide a task board for a version'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  
  permission :task_boards, {:task_boards => [:index, :show]}, :public => true
  menu :project_menu, :task_boards, { :controller => 'task_boards', :action => 'index' }, :caption => 'Task board', :after => :activity, :param => :project_id

  project_module :task_boards do
    permission :view_task_board_versions, :task_boards => :index
    permission :view_task_board, :task_boards => :vote
  end
end