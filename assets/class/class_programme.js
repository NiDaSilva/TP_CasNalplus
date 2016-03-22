 var Programme={
     allProgramme: undefined,

      init: function(){
           $.ajax({
                url : "assets/api/get_programme.php",
                type : 'GET',
                success:
                    function(data) {
                         Programme.allProgramme=JSON.parse(data);
                    },
                error:
                    function(){
                    }
           });
      }
};
