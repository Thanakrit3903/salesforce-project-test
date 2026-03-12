public with sharing class AddressUtils {
    
    /**
     * Formats an Address compound field into a comma-separated string
     * Format: Street, City, State, PostalCode, Country
     * Skips empty fields automatically
     * 
     * @param address The Address compound field to format
     * @return Formatted address string
     */
    public static String formatAddress(Address address) {
        if (address == null) {
            return '';
        }
        
        List<String> addressParts = new List<String>();
        
        if (String.isNotBlank(address.getStreet())) {
            addressParts.add(address.getStreet().trim());
        }
        
        if (String.isNotBlank(address.getCity())) {
            addressParts.add(address.getCity().trim());
        }
        
        if (String.isNotBlank(address.getState())) {
            addressParts.add(address.getState().trim());
        }
        
        if (String.isNotBlank(address.getPostalCode())) {
            addressParts.add(address.getPostalCode().trim());
        }
        
        if (String.isNotBlank(address.getCountry())) {
            addressParts.add(address.getCountry().trim());
        }
        
        return String.join(addressParts, ', ');
    }
    
    /**
     * Formats individual address components into a comma-separated string
     * Format: Street, City, State, PostalCode, Country
     * Skips empty fields automatically
     * 
     * @param street Street address
     * @param city City
     * @param state State or province
     * @param postalCode Postal/ZIP code
     * @param country Country
     * @return Formatted address string
     */
    public static String formatAddress(String street, String city, String state, String postalCode, String country) {
        List<String> addressParts = new List<String>();
        
        if (String.isNotBlank(street)) {
            addressParts.add(street.trim());
        }
        
        if (String.isNotBlank(city)) {
            addressParts.add(city.trim());
        }
        
        if (String.isNotBlank(state)) {
            addressParts.add(state.trim());
        }
        
        if (String.isNotBlank(postalCode)) {
            addressParts.add(postalCode.trim());
        }
        
        if (String.isNotBlank(country)) {
            addressParts.add(country.trim());
        }
        
        return String.join(addressParts, ', ');
    }
    
    /**
     * Formats a billing address from an Account record
     * 
     * @param account Account record with billing address fields
     * @return Formatted billing address string
     */
    public static String formatBillingAddress(Account account) {
        if (account == null) {
            return '';
        }
        
        return formatAddress(
            account.BillingStreet,
            account.BillingCity,
            account.BillingState,
            account.BillingPostalCode,
            account.BillingCountry
        );
    }
    
    /**
     * Formats a shipping address from an Account record
     * 
     * @param account Account record with shipping address fields
     * @return Formatted shipping address string
     */
    public static String formatShippingAddress(Account account) {
        if (account == null) {
            return '';
        }
        
        return formatAddress(
            account.ShippingStreet,
            account.ShippingCity,
            account.ShippingState,
            account.ShippingPostalCode,
            account.ShippingCountry
        );
    }
    
    /**
     * Formats a mailing address from a Contact record
     * 
     * @param contact Contact record with mailing address fields
     * @return Formatted mailing address string
     */
    public static String formatMailingAddress(Contact contact) {
        if (contact == null) {
            return '';
        }
        
        return formatAddress(
            contact.MailingStreet,
            contact.MailingCity,
            contact.MailingState,
            contact.MailingPostalCode,
            contact.MailingCountry
        );
    }
    
    /**
     * Formats an other address from a Contact record
     * 
     * @param contact Contact record with other address fields
     * @return Formatted other address string
     */
    public static String formatOtherAddress(Contact contact) {
        if (contact == null) {
            return '';
        }
        
        return formatAddress(
            contact.OtherStreet,
            contact.OtherCity,
            contact.OtherState,
            contact.OtherPostalCode,
            contact.OtherCountry
        );
    }
}