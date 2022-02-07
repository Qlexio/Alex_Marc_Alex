console.log('hello')

const refDataBox = document.getElementById('reference')
$.ajax({
    type: 'GET',
    url: '/articles-json/',
    success: function(response){
        console.log(response.data)
        const refData = response.data
        refData.map(item=>{
            const option = document.createElement('select')
            option.textContent = item.name
            option.setAttribute('class', 'item')
            option.setAttribute('data-value', item.name)
            refDataBox.appendChild(option)

        })
    },
    error: function(error){
        console.log(error)
    }
})