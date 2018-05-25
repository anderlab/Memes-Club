$(document).ready(function(){

   $(".opciones > button").click(function(){
	   	//cambio de estilo 
	   	$(".opciones > button").attr('class', 'btn');
	    $(this).attr('class', 'btn activo');
	    
	    //sacar informacion
	    var info=$(this).val();
	    
	    var voto=info.substr(0, info.indexOf('-')); 
	    var idPublicacion=info.substr(info.indexOf('-')+1); 
	    
	    //enviar info
	    $.post( "VotarPublicacion",  { voto: voto, idPublicacion:idPublicacion });

   });
   
   

}); 