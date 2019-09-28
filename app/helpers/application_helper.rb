module ApplicationHelper
  def menu_active(menu_name)
    'active' if controller_name == menu_name
  end

  def link_to_add_question(name, form, **args)
    association = :questions
    new_object = Question.new
    id = new_object.object_id
    fields = form.fields_for(:questions, new_object, child_index: id) do |builder|
      render('question', f: builder)
    end
    
    link_to('#', class: "add-questions " + args[:class] || '', data: { id: id, fields: fields.gsub("\n", "") }) do
      "<i class='fa fa-plus' aria-hidden='true'></i> #{name}".html_safe
    end
  end

  def link_to_add_option(name, form, **args)
    new_object = Option.new
    id = new_object.object_id
    fields = form.fields_for(:options, new_object, child_index: id) do |builder|
      render('option', f: builder)
    end
    
    link_to('#', class: "add-options " + args[:class] || '', data: { id: id, fields: fields.gsub("\n", "") }) do
      "<i class='fa fa-plus' aria-hidden='true'></i> #{name}".html_safe
    end
  end
end
