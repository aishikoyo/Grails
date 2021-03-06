<%@ page import="org.auction.Listing" %>

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'username', 'error')} required">
	<label for="name">
		<g:message code="listing.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${listingInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="listing.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${listingInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'startPrice', 'error')} required">
	<label for="startPrice">
		<g:message code="listing.startPrice.label" default="Start Price" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="startPrice" value="${fieldValue(bean: listingInstance, field: 'startPrice')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="listing.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${listingInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'listingDays', 'error')} required">
	<label for="listingDays">
		<g:message code="listing.listingDays.label" default="Listing Days" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="listingDays" type="number" value="${listingInstance.listingDays}" required=""/>
</div>

	<g:textField hidden="true" id="sellerAccount" name="sellerAccount.id" value="${listingInstance?.sellerAccount?.id}" />

<div class="fieldcontain ${hasErrors(bean: listingInstance, field: 'deliverOption', 'error')} ">
	<label for="deliverOption">
		<g:message code="listing.deliverOption.label" default="deliverOption" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="deliverOption" name="deliverOption.id" from="${org.auction.DeliverOption.list()}" optionKey="id" required=""  optionValue="name"  value="${listingInstance?.deliverOption?.id}" class="many-to-one"/>
</div>

