var index = {
    action: function () {
        $.ajax({
            url : "assets/api/get_programme.php",
            type : 'GET',
            success:function(data) {
                {
                    Programme.allProgramme=data;
                }
            },
            error:function(){
            }
        });
        index.render();
    },
    render: function(){
        render_template("assets/templates/index.html",  "_index", "#charge", {
            "horaire": "score",
            "chaine": 2,
            "programme": Programme.allProgramme
        });
    }
};
$(function(){
    render_template("maintemplate.html", "_maintemplate", "#content");
    index.action();
});