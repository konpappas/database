-- ------------- TRIGGERS -------------------------------

-- Setting event to delete reservations after one week 
CREATE EVENT IF NOT EXISTS delete_reservations_event
ON SCHEDULE
  EVERY 1 DAY_HOUR 
  ON COMPLETION PRESERVE
  COMMENT 'Clean up reservations.'
  DO
    DELETE FROM reservation
    WHERE reservation_date < DATE_SUB(NOW(), INTERVAL 7 DAY)






