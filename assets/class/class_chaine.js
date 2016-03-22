var Chaine={
    allChaine: undefined,

    init: function(){
        $.ajax({
            url : "assets/api/get_chaine.php",
            type : 'GET',
            success:
                function(data) {
                    Chaine.allChaine=JSON.parse(data);
                },
            error:
                function(){
                }
        });
    }
};
