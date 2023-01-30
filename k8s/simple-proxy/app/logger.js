/* eslint-disable no-console */
import { createLogger, format, transports } from 'winston';

const alignedWithColorsAndTime = format.combine(
  format.colorize(),
  format.timestamp(),
  format.align(),
  format.errors({ stack: true }),
  format.printf(info => `${info.timestamp} ${info.level}: ${info.message}`)
);

const logger = createLogger({
  level: process.env.LOG_LEVEL || 'info',
  format: alignedWithColorsAndTime,
  transports: [new transports.Console()]
});

export {
  logger,
};
