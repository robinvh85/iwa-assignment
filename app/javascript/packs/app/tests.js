
function hideDestroyedItems(){
  $('.hidden-destroy').each((index, item) => {
    if(item.value === "true"){
      $(item).closest('.option-fields').hide();
      resetOptionIndex($(item).closest('.option-form'))
    }
  })
}

function resetOptionIndex(container){
  let options = container.find('.option-index');
  let index = 1;
  for(let i=0; i<options.length; i++){
    if(options[i].parentElement.parentElement.style.display !== "none") {
      options[i].innerHTML = index;
      index++;
    }
  }
}

// Add event for questions
$('form').on('click', '.add-questions', function(event){
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(".question-form").append($(this).data('fields').replace(regexp, time));

  return event.preventDefault();
});

$('form').on('click', '.remove-question', function(event) {
  if(confirm('Do you want to delete question ?')){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('.question-fields').hide();
  }

  return event.preventDefault();
});

// Add event for options
$('form').on('click', '.add-options', function(event){
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).prev(".option-form").append($(this).data('fields').replace(regexp, time));
  resetOptionIndex($(this).prev(".option-form"));

  return event.preventDefault();
});

$('form').on('click', '.remove-option', function(event) {
  if(confirm('Do you want to delete option ?')){
    $(this).prev('input[type=hidden]').val('1');
    $(this).closest('.option-fields').hide();
    resetOptionIndex($(this).closest('.option-form'))
  }

  return event.preventDefault();
});

$(document).on('turbolinks:load', function() {
  hideDestroyedItems();
});
