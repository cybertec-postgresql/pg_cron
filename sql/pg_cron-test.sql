-- Check the update procedure
CREATE EXTENSION pg_cron VERSION '1.0';
SELECT extversion FROM pg_extension WHERE extname='pg_cron';
ALTER EXTENSION pg_cron UPDATE TO '1.1';
SELECT extversion FROM pg_extension WHERE extname='pg_cron';
ALTER EXTENSION pg_cron UPDATE TO '1.2';
SELECT extversion FROM pg_extension WHERE extname='pg_cron';

SELECT cron.schedule('0 10 * * *', 'VACUUM');
SELECT cron.schedule('@daily', 'SELECT pg_sleep(1');
SELECT cron.schedule('@interval(00:00:10)', 'SELECT pg_sleep(1');
SELECT cron.schedule('00:00:22'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('8 hours'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('1 seconds'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('2 days'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('@interval(02 00:30:00)', 'SELECT pg_sleep(1');
SELECT cron.schedule('2 days 12 minutes'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('00:07:00'::interval, 'SELECT pg_sleep(1');
SELECT cron.schedule('01:00:00'::interval, 'SELECT pg_sleep(1');

-- Stop scheduling a job
DO $$
BEGIN
    FOR i IN 1..11 LOOP
        PERFORM cron.unschedule(i);
    END LOOP;
END$$;

DROP EXTENSION pg_cron;