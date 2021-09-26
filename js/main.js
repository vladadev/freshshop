//Sort po kategorijama
$(document).ready(function () {
  $('div.shop-category a').on('click', function (event) {
    event.preventDefault()
    let idKategorije = $(this).data('id-kategorije')
    let baseUrl = $(this).data('url-kategorije')

    let urlKategorije = baseUrl + 'models/category-process.php'

    $.ajax({
      method: 'post',
      url: urlKategorije,
      dataType: 'json',
      data: {
        idKategorije: idKategorije,
      },
      success: function (response) {
        let artikliObj = response.artikli

        let html = ''
        artikliObj.forEach(function (product) {
          html += singleProductHtml(product)
        })
        $('#article-row').html(html)
      },
      error: function (xhr, textStatus) {
        console.log('Error:')
        console.log(xhr)
        console.log(textStatus)
      },
    })
  })

  const singleProductHtml = (product) => {
    return `
    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
      <div class="products-single fix">
          <div class="box-img-hover">
              <div class="type-lb">
                  ${productPromotions(product.promocije)}
              </div>

              <img 
                  src="images/artikli/${product.putanja_slike}" 
                  class="img-fluid" 
                  alt="images/artikli/${product.alt_slike}"
              >

              <div class="mask-icon">
                  <ul>

                      <li><a href="index.php?page=shop_detail&id=${
                        product.id_artikal
                      }" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                  </ul>

                  <input 
                      type="button" 
                      name="addToCart" 
                      id="add_to_cart"
                      class="btn hvr-hover add-to-cart-class"
                      data-id-artikla="${product.id_artikal}"
                      data-url=""
                      value="Add to Cart" 
                  >
              </div>
          </div>
          <div class="why-text">
              <h4>${product.naziv_artikla}</h4>
              <h5>$${product.cena}</h5>
          </div>
      </div>
    </div>
    `
  }

  const productPromotions = (promotion) => {
    if (promotion !== '') {
      return `
      <p class="sale">${promotion}</p>
      `
    }
    return ``
  }

  //Add to cart
  $('.add-to-cart-class').click(function (e) {
    let dataIdArtikla = $(this).data('id-artikla')
    let baseUrl = $(this).data('url')

    let url = baseUrl + 'models/cart-process.php'

    $.ajax({
      method: 'post',
      url: url,
      dataType: 'json',
      data: {
        idArtikla: dataIdArtikla,
      },
      success: function (response) {
        changeCartQuantity(response.quantity)
      },
      error: function (xhr, textStatus) {
        alert('oh no: ' + ' ' + xhr.status + ' ' + textStatus.responseText)
      },
    })
  })

  //Brisanje odabranog artikla iz korpe
  let deleteButton = document.querySelectorAll('.remove-product')

  if (deleteButton.length > 0) {
    console.log(deleteButton)

    deleteButton.forEach((element) => {
      element.addEventListener('click', () => {
        const productId = element.dataset.productId

        $.ajax({
          method: 'post',
          url: 'models/cart-process-delete.php',
          dataType: 'json',
          data: {
            productId,
          },
          success: (data) => {
            let noviArtikli = data.noviArtikli
            let html = ``
            noviArtikli.forEach((product) => {
              html += singleProductInCartHtml(product)
            })

            $('#tbody-cart-items').html(html)
          },
          error: (xhr) => {
            console.log(`Error message: ${xhr}`)
          },
        })
      })
    })
  }

  const singleProductInCartHtml = (product) => {
    return `
    <tr class="cart-content">
      <td class="thumbnail-img">
        <a href="index.php?page=shop_detail&id=${product.id_artikal}">
					<img class="img-fluid" src="images/artikli/${
            product.alt
          }" alt="images/artikli/${product.alt}">
        </a>
      </td>
      <td class="name-pr">
        <a href="index.php?page=shop_detail&id=${
          product.id_artikal
        }">Hilman Sweatshirt</a>
      </td>
      <td class="price-pr">
        <p>$${product.cena}.00</p>
      </td>
      <td class="quantity-box"><input type="number" size="4" value="${
        product.kolicina
      }" min="1" step="1" class="input-quantity" data-product-cena="${
      product.cena
    }" data-update-price-url="http://localhost/freshshop/"></td>
      <td class="total-pr">
        <p class="total-price-text">$${totalProductPrice(
          product.cena,
          product.kolicina,
        )}</p>
      </td>
      <td class="remove-pr">
        <a class="remove-product" href="#" data-product-id="${
          product.id_artikal
        }" data-cart-url="http://localhost/freshshop/">
          <i class="fas fa-times"></i>
        </a>
      </td>
    </tr>
    `
  }

  const totalProductPrice = (cena, kolicina) => {
    let ukupnaCena = cena * kolicina
    return ukupnaCena
  }

  //Promena cene za odredjeni artikal unutar korpe u odnosu na kolicinu
  $('.input-quantity').on('change', function () {
    let cenaArtikla = $(this).data('product-cena')
    let kolicina = $(this).val()

    //ovde dohvatamo trenutni element ukupne cene, gde treba biti upisana nova ukupna cena
    let azuriranaUkupnaCenaElement = $(this)
      .closest('tr')
      .find('.total-price-text')

    $.ajax({
      url: 'models/update-total-price.php',
      method: 'POST',
      dataType: 'json',
      data: {
        cenaArtikla,
        kolicina,
      },
      success: (data) => {
        azuriranaUkupnaCenaElement.html(`$${data.novaCena}.00`)
      },
      error: (err, xhr, textStatus) => {
        console.log(xhr)
        console.log('Error')
      },
    })
  })

  //Update cart summary
  $('#update-summary').click(() => {
    let allCartTotalPrices = $('.total-price-text').text()
    let iseceneCene = allCartTotalPrices.split('$')
    iseceneCene.shift()

    let subTotal = $('#sub-total')
    let grandTotal = $('#grand-total')

    let summaryPrice = 0
    iseceneCene.forEach((el) => {
      let intIseceneCene = parseInt(el, 10)
      summaryPrice += intIseceneCene
    })

    subTotal.html(`$${summaryPrice}.00`)
    grandTotal.html(`$${summaryPrice}.00`)
  })

  //Clear cart
  $('#clear-cart').click(function () {
    let cartMsg = $(this).data('clear-msg')
    let baseUrl = $(this).data('clear-url')
    let cartContent = $('.cart-content')

    let clearCartUrl = baseUrl + 'models/cart-clear.php'
    $.ajax({
      method: 'post',
      url: clearCartUrl,
      dataType: 'json',
      data: {
        cartMsg: cartMsg,
      },
      success: function () {
        cartContent.remove()
        location.reload()
      },
      error: function (xhr, textStatus) {
        alert('oh no: ' + ' ' + xhr.status + ' ' + textStatus.responseText)
      },
    })
  })
})

function changeCartQuantity(quantity) {
  $('.badge').html(quantity)
}
