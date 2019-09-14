package wp.extern;

extern class MsDefaultConstantsApi implements wp.util.ApiFunctions {
  /**
    
     Defines Multisite upload constants.
    
     Exists for backward compatibility with legacy file-serving through
     wp-includes/ms-files.php (wp-content/blogs.php in MU).
    
     @since 3.0.0
    
  **/
  public function ms_upload_constants():Void;
  /**
    
     Defines Multisite cookie constants.
    
     @since 3.0.0
    
  **/
  public function ms_cookie_constants():Void;
  /**
    
     Defines Multisite file constants.
    
     Exists for backward compatibility with legacy file-serving through
     wp-includes/ms-files.php (wp-content/blogs.php in MU).
    
     @since 3.0.0
    
  **/
  public function ms_file_constants():Void;
  /**
    
     Defines Multisite subdomain constants and handles warnings and notices.
    
     VHOST is deprecated in favor of SUBDOMAIN_INSTALL, which is a bool.
    
     On first call, the constants are checked and defined. On second call,
     we will have translations loaded and can trigger warnings easily.
    
     @since 3.0.0
    
     @staticvar bool $subdomain_error
     @staticvar bool $subdomain_error_warn
    
  **/
  public function ms_subdomain_constants():Void;
}
