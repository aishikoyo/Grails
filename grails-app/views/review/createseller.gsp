<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'review.label', default: 'Review')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
                <li><g:link action="show" controller="listing" id="${reviewInstance.listing.id}"><g:message message="Back to Listing" /></g:link></li>
			</ul>
		</div>
		<div id="create-review" class="content scaffold-create" role="main">
			<h1><g:message message="Review Seller Account" /></h1>
			<g:if test="${flash.message}">
			    <div class="message" role="status">${flash.message}</div>
			</g:if>
            <g:if test="${flash.error}">
                <div class="errors" role="alert">${flash.error}</div>
            </g:if>
			<g:hasErrors bean="${reviewInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${reviewInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:reviewInstance, action:'saveseller']" >
				<fieldset class="form">
					<g:render template="sellerform"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
