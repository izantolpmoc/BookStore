<%@ page import="Bean.Book" %>
<jsp:include page="_header.jsp"></jsp:include>


<%
    Boolean success = (Boolean) request.getAttribute("success");
    if(success != null && success == true)  {
%>
<div class="alert alert-success" role="alert">
    La commande a été passée avec succès !
</div>
<%
}
%>


<%
    Book book = (Book) request.getAttribute("book");
%>
<div class="container mb-3 basket">
    <h1>Basket</h1>

    <br>
    <hr>
    <div class="row">
        <img class="col-md-2" src="${book.getPhoto()}" width="150px" alt="${book.getTitle()}">
        <div class="col-md-10 d-flex flex-column justify-content-between">
            <div>
                <h3>Selected item: <span><%= book.getTitle() + " - " + book.getPrice() + " $"%></span></h3>
                <h5>Delivery Fees: <span>$2</span></h5>
            </div>
            <h2 class="align-self-end">TOTAL: <span><%= book.getPrice() + 2 %> $</span></h2>
        </div>

    </div>
    <hr>

    <form action="basket" method="post" id="basket">
        <div class="d-md-flex gap-3">
            <section class="flex-fill">
                <legend>Delivery Information</legend>

                <div class="mb-3">
                    <label for="firstname" class="form-label">Firstname</label>
                    <input type="text" class="form-control" id="firstname" name="firstname" required>
                </div>

                <div class="mb-3">
                    <label for="lastname" class="form-label">Lastname</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" required>
                </div>

                <div class="mb-3">
                    <label for="street" class="form-label">Street</label>
                    <input type="text" class="form-control" id="street" name="street" onchange="updateValues()" required>
                </div>

                <div class="mb-3">
                    <label for="postalCode" class="form-label">Postal Code</label>
                    <input type="text" class="form-control" id="postalCode" name="postalCode" onchange="updateValues()" required>
                </div>

                <div class="mb-3">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" onchange="updateValues()" required>
                </div>

                <div class="mb-3">
                    <label for="phone" class="form-label">Phone number</label>
                    <input type="number" class="form-control" id="phone" name="phone" title="Your number is required in case we need to contact you during the delivery process." required>
                </div>

                <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="sameBillingAddress" value="true" name="sameBillingAddress" onchange="showBillingForm()" checked>
                    <label class="form-check-label" for="sameBillingAddress">
                        Use delivery address as billing address
                    </label>
                </div>

                <div id="billingAddress" style="display: none">
                    <br>
                    <legend>Billing Address</legend>
                    <div class="mb-3">
                        <label for="street" class="form-label">Street</label>
                        <input type="text" class="form-control" id="billingStreet" name="billingStreet">
                    </div>

                    <div class="mb-3">
                        <label for="postalCode" class="form-label">Postal Code</label>
                        <input type="text" class="form-control" id="billingPostalCode" name="billingPostalCode">
                    </div>

                    <div class="mb-3">
                        <label for="city" class="form-label">City</label>
                        <input type="text" class="form-control" id="billingCity" name="billingCity">
                    </div>
                </div>
            </section>

            <section class="gradient-custom">
                <div class="container my-5 py-5">
                    <div class="row d-flex justify-content-center py-5">
                        <div>
                            <div class="card" style="border-radius: 15px;">
                                <div class="card-body p-4">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <div class="form-outline">
                                                <input type="text" id="typeText" class="form-control form-control-lg"
                                                       placeholder="1234 5678 9012 3457" name="cardNumber" required />
                                                <label class="form-label" for="typeText">Card Number</label>
                                            </div>
                                            <img src="https://img.icons8.com/color/48/000000/visa.png" alt="visa" width="64px" />
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div class="form-outline">
                                                <input type="text" id="typeName" class="form-control form-control-lg"
                                                       placeholder="Cardholder's Name" name="cardHolder" required />
                                                <label class="form-label" for="typeName">Cardholder's Name</label>
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-between align-items-center pb-2">
                                            <div class="form-outline">
                                                <input type="text" id="typeExp" class="form-control form-control-lg" placeholder="MM/YYYY"
                                                       id="exp" name="expiration" required />
                                                <label class="form-label" for="typeExp">Expiration</label>
                                            </div>
                                            <div class="form-outline">
                                                <input type="password" id="typeText2" class="form-control form-control-lg"
                                                       placeholder="&#9679;&#9679;&#9679;" minlength="3" maxlength="3" name="cvv" required />
                                                <label class="form-label" for="typeText2">Cvv</label>
                                            </div>
<%--                                            <button type="button" class="btn btn-info btn-lg btn-rounded">--%>
<%--                                                <i class="fas fa-arrow-right"></i>--%>
<%--                                            </button>--%>
                                        </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <button class="btn btn-primary" type="submit">Confirm & Pay</button>
    </form>
</div>

<script type='text/javascript'>

    function updateValues() {
        document.getElementById("billingStreet").value = document.getElementById("street").value;
        document.getElementById("billingPostalCode").value = document.getElementById("postalCode").value;
        document.getElementById("billingCity").value = document.getElementById("city").value;
    };

    function showBillingForm() {
        var billingForm = document.getElementById("billingAddress");
        if(billingForm.style.display == "none") {
            billingForm.style.display = "block";
            document.getElementById("billingStreet").setAttribute("required", "");
            document.getElementById("billingPostalCode").setAttribute("required", "");
            document.getElementById("billingCity").setAttribute("required", "");
        }

        else {
            billingForm.style.display = "none";
            document.getElementById("billingStreet").value = document.getElementById("street").value;
            document.getElementById("billingPostalCode").value = document.getElementById("postalCode").value;
            document.getElementById("billingCity").value = document.getElementById("city").value;
        }

    }
</script>

<jsp:include page="_footer.jsp"></jsp:include>