var fakeElement = {};

fakeElement.constanants = 'b c d f g k l m n p q r s t v x z'.split(' ');
fakeElement.vowels = 'a e i o u y'.split(' ');
fakeElement.categories = 'facebook twitter youtube rss'.split(' ');
fakeElement.suffices = 'on ium ogen'.split(' ');

fakeElement.getRandom = function( property ) {
  var values = fakeElement[ property ];
  return values[ Math.floor( Math.random() * values.length ) ];
};

fakeElement.create = function() {
  var widthClass = 'width2';
  var heightClass = ''  ;  
  var originType = '';
  var symbol = '';
  var name = '';
  var className = '';
      category = fakeElement.getRandom('categories');
      if (category == 'youtube')
      {
	      heightClass = 'height2';
	      symbol = 'Rick Roll';
	      originType = 'X';
	      
	      
      };
      
      if (category == 'facebook')
      {
	      heightClass = 'height1';
	      symbol = 'Facebook Friend'; 
	      originType = 'F';
	      name = 'Never gonna give you up, Never gonna let you down...';
	      
      };
      
      if (category == 'twitter')
      {
	      heightClass = 'height1';
	      symbol = '@someDouche'; 
	      originType = 'L';
	      name = 'Never gonna give you up, Never gonna let you down...';
	      
      };
      if (category == 'rss')
      {
	      heightClass = 'height1';
	      symbol = 'Rick\'s Blog'; 
	      originType = 'R';
	      name = 'Never gonna give you up, Never gonna let you down...';
	      
      };
      className = 'element ' + category + ' ' + widthClass + ' ' + heightClass;
      
  return '<div class="' + className + '" data-symbol="' + symbol + 
    '" data-category="' + category + '"><p class="originType">' + originType + 
    '</p><h3 class="symbol">' + symbol + '</h3><h2 class="name">' + name + 
    '</h2></div>';
};

fakeElement.getGroup = function() {
  var i = Math.ceil( Math.random()*3 + 1 ),
      newEls = '';
  while ( i-- ) {
    newEls += fakeElement.create();
  }
  return newEls;
};