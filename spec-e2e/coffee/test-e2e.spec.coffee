chai = require('chai')
chaiAsPromised = require('chai-as-promised')
chai.use(chaiAsPromised)
expect = chai.expect

describe 'testing with coffee', ->

  beforeEach ->
    browser.ignoreSynchronization = true

  it 'show text entered in input when the button is clicked', ->
    dvr.get('http://localhost:8080/index.html')
    dvr.findElement(By.id('myinput')).sendKeys 'hello'
    dvr.findElement(By.id('mybutton')).click()
    # expect(dvr.findElement(By.id('mydiv')).getText()).toEqual 'hello'


    expect(dvr.findElement(By.id('mydiv')).getText()).to.eventually.equal('hello');
