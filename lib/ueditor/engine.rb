require "rails"

module UEditor
  class Engine < ::Rails::Engine
    initializer "ueditor.helpers" do
      ActiveSupport.on_load :action_view do
        ActionView::Base.send :include, UEditor::Helpers::ViewHelper
        ActionView::Base.send :include, UEditor::Helpers::FormHelper
        ActionView::Helpers::FormBuilder.send :include, UEditor::Helpers::FormBuilder
      end
    end

    initializer "ueditor.hooks" do
      if Object.const_defined?("SimpleForm")
        SimpleForm.send :include, Hooks::SimpleForm
      end
    end
  end
end
