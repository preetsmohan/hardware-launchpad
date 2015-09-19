var limit=200, // Max number of stars
body=document.getElementById("header");
loop={
 //initilizeing
 start:function(){
  for (var i=0; i <= limit; i++) {
   var star=this.newStar();
   star.style.top=this.rand()*100+"%";
   star.style.left=this.rand()*100+"%";
   star.style.webkitAnimationDelay=(this.rand()*3)+"s";
   star.style.mozAnimationDelay=(this.rand()*3)+"s";
   star.style.animationDelay=(this.rand()*3)+"s";
   body.appendChild(star);
  };
 },
 //to get random number
 rand:function(){
  return Math.random();
 },
 //createing html dom for star
 newStar:function(){
  var d = document.createElement('div');
  d.innerHTML = '<div class="star"></div>';
   return d.firstChild;
 },
};
loop.start();