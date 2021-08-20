document.addEventListener('readystatechange', function () {
    let select = document.getElementById('version-select');
    select.addEventListener('change', function () {
        let newLocation = document.location.toString().split('/');
        newLocation[5] = select.value;
        document.location = newLocation.join('/');
    });
});
