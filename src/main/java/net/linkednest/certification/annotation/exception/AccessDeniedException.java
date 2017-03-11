package net.linkednest.certification.annotation.exception;

public class AccessDeniedException extends Exception {

    private static final long serialVersionUID = 1L;

    public AccessDeniedException() {
        super();
    }

    public AccessDeniedException(String message) {
        super(message);
    }

}
