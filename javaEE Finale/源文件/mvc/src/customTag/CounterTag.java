package customTag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspTag;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

public class CounterTag  extends SimpleTagSupport {
    private static int counter = 1;
    @Override
    public void doTag() throws JspException, IOException {

        getJspContext().getOut().print(counter);
        counter++;

    }


}
