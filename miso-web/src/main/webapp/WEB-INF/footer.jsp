<%@ taglib prefix="miso" uri="http://miso.tgac.bbsrc.ac.uk/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</div>
<div id="footer">
    <br/>

    <p>
        &copy; 2010 - <fmt:formatDate value="${timestamp}" pattern="yyyy"/>
        <a href="https://github.com/miso-lims/miso-lims">MISO LIMS</a> | Version:
        ${miso:version()}
	<br>New York University | <a href="https://gencore.bio.nyu.edu">CGSB Genomics Core</a>
    </p>
</div>
</body>
</html>
