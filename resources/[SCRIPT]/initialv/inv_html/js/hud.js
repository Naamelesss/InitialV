$(document).ready(function(){
    var nimmug = document.getElementsByClassName('mugshotpos')[0].getBoundingClientRect();
  
    $.post('http://status/setmugpos', JSON.stringify({
      y: nimmug.y/window.innerHeight,
      x: nimmug.x/window.innerWidth,
      w: nimmug.width/window.innerWidth,
      h: nimmug.height/window.innerHeight
    }));
    $('body').hide();
    $('body').css('visibility','visible');
    window.addEventListener("message", function(event){
      if(event.data.update == true){
        setProgress(event.data.health,'.progress-health');
        setProgress(event.data.armor,'.progress-armor');
      }
      if(event.data.display == true){
        $("body").fadeIn(400);
      }else if(event.data.display == false){
        $("body").fadeOut(400);
      }else if (event.data.action == "job"){
        updateJob(event.data);
      }else if (event.data.action == "gang"){
              updateGang(event.data);
          }else if (event.data.action == "updateStatus"){
              updateStatus(event.data.status);
          }else if (event.data.action == "cash"){
              updateCash(event.data);
          }else if (event.data.action == "playerName"){
              updateName(event.data);
          }else if (event.data.action == "ping"){
              updatePing(event.data);
          }
    });
  
    // Functions
    // Update health/thirst bars
    function setProgress(percent, element){
      $(element).width(percent + '%');
    }
  
    function updateJob(data){
      $("[name='job']").html(data.value)
      $("[name='jobimg']").attr('src', 'assets/imgs/'+data.icon+'.png')
    }
  
    function updatePing(data){
      $("[name='ping']").html(data.value)
    }
  
    function updateCash(data){
      $("[name='cash']").html(data.value)
    }
  
    function updateName(data){
      $("[name='PlayerName']").html(data.value)
    }
  
    function updateGang(data){
      $("[name='gang']").html(data.value)
    }
  
    setProgress(70,'.progress-inventory');
  
    // Clock based on user's local hour
    function updateClock() {
      var now = new Date(),
          time = (now.getHours()<10?'0':'') + now.getHours() + ':' + (now.getMinutes()<10?'0':'') + now.getMinutes();
  
      document.getElementById('hour').innerHTML = [time];
      setTimeout(updateClock, 1000);
    }
  
    function updateStatus(status){
      var hunger = status[0]
      var thirst = status[1]
      setProgress(hunger.percent,'.progress-hunger');
      setProgress(thirst.percent,'.progress-thirst');
    }
    updateClock();
  
  });
  