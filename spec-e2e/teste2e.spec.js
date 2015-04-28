describe('testing with coffee', function() {
  beforeEach(function() {
    return browser.ignoreSynchronization = true;
  });
  return it('show text entered in input when the button is clicked', function() {
    dvr.get('http://localhost:8080/index.html');
    dvr.findElement(By.id('myinput')).sendKeys('hello');
    dvr.findElement(By.id('mybutton')).click();
    return expect(dvr.findElement(By.id('mydiv')).getText()).toEqual('hello');
  });
});
