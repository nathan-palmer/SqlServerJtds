#' A function that connects an R session to a running instance of
#' Microsoft SQL Server using the jTDS driver and RJDBC.
#'
#' @param database The name of the database on the server that you want to connect to
#' @param user The user name that you want to use to authenticate against SQL Server
#' @param password The password for the user that will be authenticated against SQL Server
#' @param server.address The network address of the Windows instance that is running SQL Server
#' @param domain The domain to use in the case of NTLM logins, NA if using SQL Server login credentials
#' @keywords SQL Server RJDBC
#' @export
#' @examples
#' connect.sql.server()

connect.sql.server <- function(database, user, password, server.address, domain=NA) {

        ## get a ref to the specified driver in the included .jar file
        drv <- JDBC("net.sourceforge.jtds.jdbc.Driver")

        ## check whether we are trying to use SQL or NTLM login credentials
        if (is.na(domain)) {
                ## SQL Server login
                conn.str = paste("jdbc:jtds:sqlserver://", server.address, "/", database, ";ssl=require;", sep="")
        } else {
                ## NTLM login (Windows user)
                conn.str = paste("jdbc:jtds:sqlserver://", server.address, "/", database, ";ssl=require;domain=", domain, sep="")
        }

        ## connect to the server
        conn <- dbConnect(drv, conn.str, user, password)
        return (conn)
}


