<?php

$query = $conn->prepare(
    'SELECT id_korisnik, ime, prezime, email, password, u.naziv FROM korisnik k INNER JOIN uloga u ON u.id_uloga = k.uloga_id WHERE id_korisnik = :id_korisnik'
);
$query->bindParam(':id_korisnik', $_SESSION['id_korisnik']);
$query->execute();
$result = $query->fetchAll(PDO::FETCH_ASSOC);
$ulogovanKorisnik = (object) $result[0];

$updateUserUrl = NEW_BASE_URL . 'index.php?page=update-profile';
?>
<br/>
<div class="container">
    <?php if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true): ?>
    
    <h1 class="profile-headding">Greetings <span class="user-name-span"><?php echo $_SESSION[
        'ime'
    ]; ?></span>. Here you can see and edit your profile information!</h1><br/>
    <form class="form-horizontal row-fluid update-profile-form" action='<?php echo $updateUserUrl; ?>' method="POST">
		<input type="hidden" name="id" id="basicinput" placeholder="Article..." class="span8" value='<?php echo $ulogovanKorisnik->id_korisnik; ?>'>
		<div class="control-group">
            <label class="control-label">Name</label>
            <div class="controls update-acc-info-input-wrapper">
                <input type="text" name="ime-korisnika" id="nameInput" placeholder="User name..." class="span8 form-control update-acc-info-input" value='<?php echo $ulogovanKorisnik->ime; ?>'>
            </div>
        </div>

        <div class="control-group">
	        <label class="control-label">Last Name</label>
	        <div class="controls update-acc-info-input-wrapper">
	        	<input type="text" name="prezime-korisnika" id="lastNameInput" placeholder="User last name..." class="span8 form-control update-acc-info-input" value='<?php echo $ulogovanKorisnik->prezime; ?>'>
	        </div>
        </div>

        <div class="control-group">
            <label class="control-label">E-mail</label>
            <div class="controls update-acc-info-input-wrapper">
                <input type="text" name="email-korisnika" id="emailInput" placeholder="User e-mail..." class="span8 form-control update-acc-info-input" value='<?php echo $ulogovanKorisnik->email; ?>'>
                <span class="help-inline">E-mail format: example@gmail.com</span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">New password</label>
            <div class="controls update-acc-info-input-wrapper">
                <input type="password" name="password-korisnika" id="passInput" placeholder="Your new password..." class="span8 form-control update-acc-info-input">
                <span class="help-inline">Password format: Qwer92</span>
            </div>
        </div>
        <br/>
		<input type="submit" value="Update" class="btn btn-primary update-acc-info-button">
	</form><br/>

    
    <div id="registerFormErrors" class="form-row">
        <?php if (isset($_REQUEST['error'])) {
            echo '<p>' . $_REQUEST['error'] . '</p>';
        } ?>
    </div>
        
   
    <?php else: ?>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
    	<h1>You have to log in in to view this page!</h1>
    </div>
	<?php endif; ?>

        

</div>