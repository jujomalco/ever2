(function(){ 
    $("#qDesea").on("change", function() {
        $('#qEspecialidad').removeAttr('hidden');
        $('#qDesea').removeClass('w-40');
        $('#qDesea').addClass('w-25');
        $('.input-buscador').removeClass('w-40');
        $('.input-buscador').addClass('w-25');
    })
 })();
(function(){ 
    $("#qEspecialidad").on("change", function() {
        $('#qCiudad').removeAttr('hidden');
        $('#qDesea').removeClass('w-25');
        $('#qDesea').addClass('w-20');
        $('#qEspecialidad').removeClass('w-25');
        $('#qEspecialidad').addClass('w-20');
        $('.input-buscador').removeClass('w-25');
        $('.input-buscador').addClass('w-20');
    })
 })();