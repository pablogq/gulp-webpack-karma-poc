text = document.createElement 'p'
text.innerHTML = 'This text was added by my awesome module!'
text.id = 'content'
document.body.appendChild(text)



# protractor code for sample test
div = document.createElement 'div'
div.id = 'mydiv'
document.body.appendChild div

input = document.createElement 'input'
input.type = 'text'
input.name = 'myinput'
input.id = 'myinput'
document.body.appendChild  input

button = document.createElement 'button'
button.id = 'mybutton'
button.innerText = 'press me'




showText = ->
  _input = document.getElementById("myinput")
  if _input.value.length
    div.innerText = _input.value
    div.style.color = '#f00'
    div.style.border = 'black solid 1px'
    div.style.width = "500px"
    div.style.background = '#eee'
    div.style.margin = '15px 0 15px'
    div.style.padding = '10px'

button.onclick = showText



document.body.appendChild  button
