var index = {
    action: function () {
        Chaine.init();
        Programme.init();
        index.render();
    },
    render: function(){
        render_template("assets/templates/index.html",  "_index", "#charge", {
            "horaire": "score",
            "chaine": Programme.allProgramme,
            "programme": Programme.allProgramme
        });
    }
};
$(function(){
    render_template("maintemplate.html", "_maintemplate", "#content");
    index.action();
});