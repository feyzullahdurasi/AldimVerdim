interface ErrorLog {
  message: string;
  stack?: string;
  timestamp: number;
  userId?: string;
}

export class ErrorTracker {
  private static logs: ErrorLog[] = [];

  static logError(error: Error, userId?: string) {
    const errorLog: ErrorLog = {
      message: error.message,
      stack: error.stack,
      timestamp: Date.now(),
      userId
    };

    this.logs.push(errorLog);
    
    // Hata izleme servisine gönder
    this.sendToErrorService(errorLog);
  }

  private static async sendToErrorService(log: ErrorLog) {
    try {
      await fetch('/api/error-logging', {
        method: 'POST',
        body: JSON.stringify(log)
      });
    } catch (error) {
      console.error('Hata logu gönderilemedi:', error);
    }
  }
}