(function(){ 
    $("#qDesea").on("change", function() {
        $('#qCiudad').removeAttr('hidden');
        $('#qDesea').removeClass('w-40');
        $('#qDesea').addClass('w-25');
        $('.has-feedback').removeClass('w-40');
        $('.has-feedback').addClass('w-25');
    })
 })();