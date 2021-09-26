$(document).ready(function () {
  $('#formLogin').submit(function (event) {
    loginCheck(event)
  })
})

function loginCheck(event) {
  let $email = $('#loginEmail')
  let $password = $('#loginPassword')

  let errors = []

  let validateEmail = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
  let validatePassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{5,}$/

  //Email
  if ($email.val() == '') {
    errors.push('Enter e-mail address!')
    event.preventDefault()
  } else {
    if (validateEmail.test($email.val())) {
      console.log('email  ok!')
    } else {
      errors.push(
        'E-mail is not in a good format. Expected format: example@gmail.com',
      )
      event.preventDefault()
    }
  }
  //Password
  if ($password.val() == '') {
    errors.push('Enter password!')
    event.preventDefault()
  } else {
    if (validatePassword.test($password.val())) {
      console.log('Ime ok!')
    } else {
      errors.push(
        'Password must have minimum 5 characters, 1 number and 1 capital letter!',
      )
      event.preventDefault()
    }
  }

  let html = ''
  if (errors.length !== 0) {
    for (let i = 0; i < errors.length; i++) {
      html += `${errors[i]}<br>`
    }
    $('#loginFormErrors').html(html)
  }
}
