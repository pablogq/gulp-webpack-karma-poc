require '../src/scripts/main'
describe 'Proof of concept', ->

  it 'displays the message', ->
    expected = 'This text was added by my awesome module!'
    element = document.getElementById 'content'
    expect(element.innerHTML.trim()).to.be.equals expected
