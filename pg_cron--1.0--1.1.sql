CREATE FUNCTION cron.schedule(schedule interval, command text)
    RETURNS bigint
    LANGUAGE C STRICT
    AS 'MODULE_PATHNAME', $$cron_schedule_interval$$;
COMMENT ON FUNCTION cron.schedule(interval,text)
    IS 'schedule a pg_cron job to run periodically';
