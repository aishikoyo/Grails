
<%@ page import="org.auction.Account" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-account" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link action="index" controller="listing"><g:message message="Check Listing" /></g:link></li>
			</ul>
		</div>

    <div id="show-account" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list account">
            <g:if test="${accountInstance?.name}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="account.name.label" default="Name" /></span>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${accountInstance}" field="name"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.email}">
                <li class="fieldcontain">
                    <span id="email-label" class="property-label"><g:message code="account.email.label" default="Email" /></span>
                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${accountInstance}" field="email"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.address}">
                <li class="fieldcontain">
                    <span id="address-label" class="property-label"><g:message code="account.address.label" default="Address" /></span>
                    <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${accountInstance}" field="address"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.password}">
                <li class="fieldcontain">
                    <span id="password-label" class="property-label"><g:message code="account.password.label" default="Password" /></span>
                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${accountInstance}" field="password"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.lastUpdated}">
                <li class="fieldcontain">
                    <span id="lastUpdated-label" class="property-label"><g:message code="account.lastUpdated.label" default="LastUpdated" /></span>
                    <span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${accountInstance}" field="lastUpdated"/></span>
                </li>
            </g:if>
            <g:form url="[resource:accountInstance, action:'ThumbUp']" method="GET">
            <li class="fieldcontain">
                <span id="thumbUp-label" class="property-label"><g:message code="account.thumbUp.label" default="ThumbUp" /></span>
                <span class="property-value" aria-labelledby="thumbUp-label"><g:link url="[resource:accountInstance, action:'ThumbUp']" ><g:fieldValue bean="${accountInstance}" field="thumbUp"/></g:link></span>
            </li>
            </g:form>

            <li class="fieldcontain">
                <span id="thumbDown-label" class="property-label"><g:message code="account.thumbDown.label" default="ThumbDown" /></span>
                <span class="property-value" aria-labelledby="thumbDown-label"><g:link url="[resource:accountInstance, action:'ThumbDown']" ><g:fieldValue bean="${accountInstance}" field="thumbDown"/></g:link></span>
            </li>


        </ol>
        <g:form url="[resource:accountInstance, action:'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${accountInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>

	</body>
</html>
