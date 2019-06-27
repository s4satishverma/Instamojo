<html>
<head></head>
<body>

Hi sharad kataria..................

<%@page import="java.sql.*"%>
<%@page import="java.util.logging.Logger"%>

<%@page import="java.util.*"%>
<%@page import="java.util.logging.Level"%>

<%@page import="com.instamojo.wrapper.api.Instamojo"%>
<%@page import="com.instamojo.wrapper.api.InstamojoImpl"%>
<%@page import="com.instamojo.wrapper.exception.ConnectionException"%>
<%@page import="com.instamojo.wrapper.exception.InvalidPaymentOrderException"%>
<%@page import="com.instamojo.wrapper.model.PaymentOrder"%>
<%@page import="com.instamojo.wrapper.response.CreatePaymentOrderResponse"%>

<%@page import="com.instamojo.wrapper.exception.InvalidRefundException"%>
<%@page import="com.instamojo.wrapper.model.PaymentOrderFilter"%>
<%@page import="com.instamojo.wrapper.model.Refund"%>
<%@page import="com.instamojo.wrapper.response.CreateRefundResponse"%>
<%@page import="com.instamojo.wrapper.response.PaymentOrderDetailsResponse"%>
<%@page import="com.instamojo.wrapper.response.PaymentOrderListResponse"%>
<%@page import="com.tutor.dao.TransactionDao"%>
<%@page import="com.tutor.dao.TransactionDaoImpl"%>

          
<%! String uemail,name;   double price; %>

<%
uemail="s4satishverma@gmail.com";
name="Satish Verma";
price=123456.00d;


PaymentOrder order = new PaymentOrder();

order.setName("Satish Verma");
order.setEmail("s4satishverma@gmail.com");
order.setPhone("7827220430");
order.setCurrency("INR");
order.setAmount(price);
order.setDescription("This is a test transaction.");
order.setRedirectUrl("http://comhub.automatedcloudorchestrator.com/success.jsp");
order.setWebhookUrl("http://www.google.com/");
order.setTransactionId("dxg234510");

Instamojo api = null;

try {
	String var1= "test_oA7F1jbuqieovfiXcKzJhK722IolO0ALh77";
	String var2= "test_S9NnjET0zjn0cGsdO20PwJAqyeL18HJJL7ZNCzi4nDVqvO5dxDWMkxTqVE3OkdghJ2S2T33Ww7p5x5Hz7mI0o2NB7mKCA78tdlGnpzPHIbU1Gw35oQqFDkCBggK";
	String var3= "https://test.instamojo.com/v2/";
	String var4= "https://test.instamojo.com/oauth2/token/";
// gets the reference to the instamojo api
	
	api = InstamojoImpl.getApi(var1, var2, var3, var4);
} catch (ConnectionException e) {
}

boolean isOrderValid = order.validate();
String paymentOrderId="";

if (isOrderValid) {
	try {
		CreatePaymentOrderResponse createPaymentOrderResponse = api.createNewPaymentOrder(order);
   paymentOrderId= createPaymentOrderResponse.getPaymentOrder().getId();
   System.out.println(",,,,,,,,,,,,,,,,,,,,,,,,,,"+createPaymentOrderResponse.getPaymentOptions().getPaymentUrl());
	
   response.sendRedirect(createPaymentOrderResponse.getPaymentOptions().getPaymentUrl());

    
	    // print the status of the payment order.
		System.out.println(createPaymentOrderResponse.getPaymentOrder().getStatus());
	} catch (InvalidPaymentOrderException e) {

	    if (order.isTransactionIdInvalid()) {
	        System.out.println("Transaction id is invalid. This is mostly due to duplicate  transaction id.");
	    }
	    if (order.isCurrencyInvalid()) {
	        System.out.println("Currency is invalid.");
	    }
	} catch (ConnectionException e) {
    }
} else {
	 out.println("........................................");
	// inform validation errors to the user.
	if (order.isTransactionIdInvalid()) {
	    System.out.println("Transaction id is invalid.");
	}
	if (order.isAmountInvalid()) {
	  System.out.println("Amount can not be less than 9.00.");
	}
	if (order.isCurrencyInvalid()) {
	  System.out.println("Please provide the currency.");
	}
	if (order.isDescriptionInvalid()) {
	  System.out.println("Description can not be greater than 255 characters.");
        }
	if (order.isEmailInvalid()) {
	  System.out.println("Please provide valid Email Address.");
	}
	if (order.isNameInvalid()) {
	  System.out.println("Name can not be greater than 100 characters.");
	}
	if (order.isPhoneInvalid()) {
	  System.out.println("Phone is invalid.");
	}
	if (order.isRedirectUrlInvalid()) {
	  System.out.println("Please provide valid Redirect url.");
	}
	
	if (order.isWebhookInvalid()) {
      System.out.println("Provide a valid webhook url");
    }
}

try {
	 PaymentOrderDetailsResponse paymentOrderDetailsResponse = api.getPaymentOrderDetails(paymentOrderId);

	if (paymentOrderDetailsResponse.getId() != null) {
		// print the status of the payment order.
		System.out.println("status...."+paymentOrderDetailsResponse.getStatus());
	} else {
		System.out.println("Please enter valid order id.");
	}
} catch (ConnectionException e) {
	System.out.println(e);
	//LOGGER.log(Level.SEVERE, e.toString(), e);
}


/*
* Get details of payment order when transaction id is given
*/

try {
	PaymentOrderDetailsResponse paymentOrderDetailsResponse = api.getPaymentOrderDetailsByTransactionId("dxg234510");

	if (paymentOrderDetailsResponse.getId() != null) {
		// print the status of the payment order.
		System.out.println("Payment order detiasl..."+paymentOrderDetailsResponse.getStatus());
	} else {
		System.out.println("Please enter valid transaction id.");
	}
} catch (ConnectionException e) {
	System.out.println(e);
	//LOGGER.log(Level.SEVERE, e.toString(), e);
}



/*
* Get list of all payment orders
*/

try {
	PaymentOrderFilter paymentOrderFilter = new PaymentOrderFilter();
	PaymentOrderListResponse paymentOrderListResponse = api.getPaymentOrderList(paymentOrderFilter);
	// Loop over all of the payment orders and print status of each
	// payment order.
	for (PaymentOrder paymentOrder : paymentOrderListResponse.getPaymentOrders()) {
		System.out.println("Result = " + paymentOrder.getStatus());
	}
	System.out.println(paymentOrderListResponse.getPaymentOrders());
} catch (ConnectionException e) {
	System.out.println(e);
	//LOGGER.log(Level.SEVERE, e.toString(), e);
}


%>
</body>
</html>