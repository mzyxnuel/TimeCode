package timecode.model.net;

import java.io.StringWriter;

import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;

public class JAXB {
   private JAXBContext jaxb;
   private Marshaller marshaller;

   public JAXB(Class jclass) {
      try {
         jaxb = JAXBContext.newInstance(jclass);
         marshaller = jaxb.createMarshaller();
         marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
      } catch (JAXBException e) {
         e.printStackTrace();
      }
   }

   public String marshal(Object obj) {
      StringWriter xml = new StringWriter();
      try {
         marshaller.marshal(obj, xml);
      } catch (JAXBException e) {
         e.printStackTrace();
      }
      return xml.toString();
   }
}
