package wp.extern;

extern class CronApi implements wp.util.ApiFunctions {
  /**
    
     Schedules an event to run only once.
    
     Schedules a hook which will be triggered by WordPress at the specified time.
     The action will trigger when someone visits your WordPress site if the scheduled
     time has passed.
    
     Note that scheduling an event to occur within 10 minutes of an existing event
     with the same action hook will be ignored unless you pass unique `$args` values
     for each scheduled event.
    
     Use wp_next_scheduled() to prevent duplicate events.
    
     Use wp_schedule_event() to schedule a recurring event.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to boolean indicating success or failure,
                  {@see 'pre_schedule_event'} filter added to short-circuit the function.
    
     @link https://codex.wordpress.org/Function_Reference/wp_schedule_single_event
    
     @param int    $timestamp  Unix timestamp (UTC) for when to next run the event.
     @param string $hook       Action hook to execute when the event is run.
     @param array  $args       Optional. Array containing each separate argument to pass to the hook's callback function.
     @return bool True if event successfully scheduled. False for failure.
    
  **/
  public function wp_schedule_single_event(timestamp:Int, hook:String, ?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Schedules a recurring event.
    
     Schedules a hook which will be triggered by WordPress at the specified interval.
     The action will trigger when someone visits your WordPress site if the scheduled
     time has passed.
    
     Valid values for the recurrence are 'hourly', 'daily', and 'twicedaily'. These can
     be extended using the {@see 'cron_schedules'} filter in wp_get_schedules().
    
     Note that scheduling an event to occur within 10 minutes of an existing event
     with the same action hook will be ignored unless you pass unique `$args` values
     for each scheduled event.
    
     Use wp_next_scheduled() to prevent duplicate events.
    
     Use wp_schedule_single_event() to schedule a non-recurring event.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to boolean indicating success or failure,
                  {@see 'pre_schedule_event'} filter added to short-circuit the function.
    
     @link https://codex.wordpress.org/Function_Reference/wp_schedule_event
    
     @param int    $timestamp  Unix timestamp (UTC) for when to next run the event.
     @param string $recurrence How often the event should subsequently recur. See wp_get_schedules() for accepted values.
     @param string $hook       Action hook to execute when the event is run.
     @param array  $args       Optional. Array containing each separate argument to pass to the hook's callback function.
     @return bool True if event successfully scheduled. False for failure.
    
  **/
  public function wp_schedule_event(timestamp:Int, recurrence:String, hook:String, ?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Reschedules a recurring event.
    
     Mainly for internal use, this takes the time stamp of a previously run
     recurring event and reschedules it for its next run.
    
     To change upcoming scheduled events, use wp_schedule_event() to
     change the recurrence frequency.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to boolean indicating success or failure,
                  {@see 'pre_reschedule_event'} filter added to short-circuit the function.
    
     @param int    $timestamp  Unix timestamp (UTC) for when the event was scheduled.
     @param string $recurrence How often the event should subsequently recur. See wp_get_schedules() for accepted values.
     @param string $hook       Action hook to execute when the event is run.
     @param array  $args       Optional. Array containing each separate argument to pass to the hook's callback function.
     @return bool True if event successfully rescheduled. False for failure.
    
  **/
  public function wp_reschedule_event(timestamp:Int, recurrence:String, hook:String, ?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Unschedule a previously scheduled event.
    
     The $timestamp and $hook parameters are required so that the event can be
     identified.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to boolean indicating success or failure,
                  {@see 'pre_unschedule_event'} filter added to short-circuit the function.
    
     @param int    $timestamp Unix timestamp (UTC) of the event.
     @param string $hook      Action hook of the event.
     @param array  $args      Optional. Array containing each separate argument to pass to the hook's callback function.
                              Although not passed to a callback, these arguments are used to uniquely identify the
                              event, so they should be the same as those used when originally scheduling the event.
     @return bool True if event successfully unscheduled. False for failure.
    
  **/
  public function wp_unschedule_event(timestamp:Int, hook:String, ?args:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Unschedules all events attached to the hook with the specified arguments.
    
     Warning: This function may return Boolean FALSE, but may also return a non-Boolean
     value which evaluates to FALSE. For information about casting to booleans see the
     {@link https://php.net/manual/en/language.types.boolean.php PHP documentation}. Use
     the `===` operator for testing the return value of this function.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to indicate success or failure,
                  {@see 'pre_clear_scheduled_hook'} filter added to short-circuit the function.
    
     @param string $hook Action hook, the execution of which will be unscheduled.
     @param array $args Optional. Arguments that were to be passed to the hook's callback function.
     @return bool|int On success an integer indicating number of events unscheduled (0 indicates no
                      events were registered with the hook and arguments combination), false if
                      unscheduling one or more events fail.
    
  **/
  public function wp_clear_scheduled_hook(hook:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Unschedules all events attached to the hook.
    
     Can be useful for plugins when deactivating to clean up the cron queue.
    
     Warning: This function may return Boolean FALSE, but may also return a non-Boolean
     value which evaluates to FALSE. For information about casting to booleans see the
     {@link https://php.net/manual/en/language.types.boolean.php PHP documentation}. Use
     the `===` operator for testing the return value of this function.
    
     @since 4.9.0
     @since 5.1.0 Return value added to indicate success or failure.
    
     @param string $hook Action hook, the execution of which will be unscheduled.
     @return bool|int On success an integer indicating number of events unscheduled (0 indicates no
                      events were registered on the hook), false if unscheduling fails.
    
  **/
  public function wp_unschedule_hook(hook:String):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Retrieve a scheduled event.
    
     Retrieve the full event object for a given event, if no timestamp is specified the next
     scheduled event is returned.
    
     @since 5.1.0
    
     @param string   $hook      Action hook of the event.
     @param array    $args      Optional. Array containing each separate argument to pass to the hook's callback function.
                                Although not passed to a callback, these arguments are used to uniquely identify the
                                event, so they should be the same as those used when originally scheduling the event.
     @param int|null $timestamp Optional. Unix timestamp (UTC) of the event. If not specified, the next scheduled event is returned.
     @return bool|object The event object. False if the event does not exist.
    
  **/
  public function wp_get_scheduled_event(hook:String, ?args:php.NativeStructArray<Dynamic>, timestamp:Int = null):haxe.extern.EitherType<Bool, Dynamic>;
  /**
    
     Retrieve the next timestamp for an event.
    
     @since 2.1.0
    
     @param string $hook Action hook of the event.
     @param array  $args Optional. Array containing each separate argument to pass to the hook's callback function.
                         Although not passed to a callback, these arguments are used to uniquely identify the
                         event, so they should be the same as those used when originally scheduling the event.
     @return false|int The Unix timestamp of the next time the event will occur. False if the event doesn't exist.
    
  **/
  public function wp_next_scheduled(hook:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<Bool, Int>;
  /**
    
     Sends a request to run cron through HTTP request that doesn't halt page loading.
    
     @since 2.1.0
     @since 5.1.0 Return values added.
    
     @param int $gmt_time Optional. Unix timestamp (UTC). Default 0 (current time is used).
     @return bool True if spawned, false if no events spawned.
    
  **/
  public function spawn_cron(gmt_time:Int = 0):Bool;
  /**
    
     Run scheduled callbacks or spawn cron for all scheduled events.
    
     Warning: This function may return Boolean FALSE, but may also return a non-Boolean
     value which evaluates to FALSE. For information about casting to booleans see the
     {@link https://php.net/manual/en/language.types.boolean.php PHP documentation}. Use
     the `===` operator for testing the return value of this function.
    
     @since 2.1.0
     @since 5.1.0 Return value added to indicate success or failure.
    
     @return bool|int On success an integer indicating number of events spawned (0 indicates no
                      events needed to be spawned), false if spawning fails for one or more events.
    
  **/
  public function wp_cron():haxe.extern.EitherType<Bool, Int>;
  /**
    
     Retrieve supported event recurrence schedules.
    
     The default supported recurrences are 'hourly', 'twicedaily', and 'daily'. A plugin may
     add more by hooking into the {@see 'cron_schedules'} filter. The filter accepts an array
     of arrays. The outer array has a key that is the name of the schedule or for
     example 'weekly'. The value is an array with two keys, one is 'interval' and
     the other is 'display'.
    
     The 'interval' is a number in seconds of when the cron job should run. So for
     'hourly', the time is 3600 or 60*60. For weekly, the value would be
     60*60*24*7 or 604800. The value of 'interval' would then be 604800.
    
     The 'display' is the description. For the 'weekly' key, the 'display' would
     be `__( 'Once Weekly' )`.
    
     For your plugin, you will be passed an array. you can easily add your
     schedule by doing the following.
    
         // Filter parameter variable name is 'array'.
         $array['weekly'] = array(
             'interval' => 604800,
             'display'  => __( 'Once Weekly' )
         );
    
     @since 2.1.0
    
     @return array
    
  **/
  public function wp_get_schedules():php.NativeArray;
  /**
    
     Retrieve the recurrence schedule for an event.
    
     @see wp_get_schedules() for available schedules.
    
     @since 2.1.0
     @since 5.1.0 {@see 'get_schedule'} filter added.
    
     @param string $hook Action hook to identify the event.
     @param array $args Optional. Arguments passed to the event's callback function.
     @return string|false False, if no schedule. Schedule name on success.
    
  **/
  public function wp_get_schedule(hook:String, ?args:php.NativeStructArray<Dynamic>):haxe.extern.EitherType<String, Bool>;
  /**
    
     Retrieve cron jobs ready to be run.
    
     Returns the results of _get_cron_array() limited to events ready to be run,
     ie, with a timestamp in the past.
    
     @since 5.1.0
    
     @return array Cron jobs ready to be run.
    
  **/
  public function wp_get_ready_cron_jobs():php.NativeArray;
  /**
    
     Retrieve cron info array option.
    
     @since 2.1.0
     @access private
    
     @return false|array CRON info array.
    
  **/
  public function _get_cron_array():haxe.extern.EitherType<Bool, php.NativeStructArray<Dynamic>>;
  /**
    
     Updates the CRON option with the new CRON array.
    
     @since 2.1.0
     @since 5.1.0 Return value modified to outcome of update_option().
    
     @access private
    
     @param array $cron Cron info array from _get_cron_array().
     @return bool True if cron array updated, false on failure.
    
  **/
  public function _set_cron_array(cron:php.NativeStructArray<Dynamic>):Bool;
  /**
    
     Upgrade a Cron info array.
    
     This function upgrades the Cron info array to version 2.
    
     @since 2.1.0
     @access private
    
     @param array $cron Cron info array from _get_cron_array().
     @return array An upgraded Cron info array.
    
  **/
  public function _upgrade_cron_array(cron:php.NativeStructArray<Dynamic>):php.NativeArray;
}
