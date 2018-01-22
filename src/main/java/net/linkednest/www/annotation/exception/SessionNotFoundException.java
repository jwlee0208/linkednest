package net.linkednest.www.annotation.exception;

public class SessionNotFoundException extends Exception{

    private static final long serialVersionUID = 1L;

    public SessionNotFoundException() {
        super();
    }

    public SessionNotFoundException(String message) {
        super(message);
    }
}
