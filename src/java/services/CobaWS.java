/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import controller.testDOA;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * REST Web Service
 *
 * @author user
 */
@Path("cobaWS")
public class CobaWS {
public static SessionFactory factory;
    @Context
    private UriInfo context;

    /**
     * Creates a new instance of CobaWS
     */
    public CobaWS() {
    }

    /**
     * Retrieves representation of an instance of services.CobaWS
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getJson() {
        return ("{\"pesan\" : \"halooooo\"}");
    }
    
   @Path("/getAllUsers/")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public void getAllUsers() {
        testDOA dataAccess = new testDOA();
        dataAccess.getAllUser();
    }
   
}
