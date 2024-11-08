package util;

import java.io.File;

import org.tmatesoft.svn.core.SVNCommitInfo;
import org.tmatesoft.svn.core.SVNDepth;
import org.tmatesoft.svn.core.SVNException;
import org.tmatesoft.svn.core.SVNURL;
import org.tmatesoft.svn.core.wc.SVNClientManager;
import org.tmatesoft.svn.core.wc.SVNCommitClient;
import org.tmatesoft.svn.core.wc.SVNUpdateClient;
import org.tmatesoft.svn.core.wc.SVNWCClient;

public class MySvnUtil {
	 private static final String SVN_URL = "http://112.220.114.130:10001/svn/projects/202403M/team2/documents";
	 private static final String CHECKOUT_DIR = "C:/project_2_university";

	 public static void setUpdate() {
	        SVNClientManager clientManager = SVNClientManager.newInstance();
	        SVNUpdateClient updateClient = clientManager.getUpdateClient();
	        SVNWCClient wcClient = clientManager.getWCClient();

	        try {
	        	File checkoutDir = new File(CHECKOUT_DIR);
	        	
//	        	if (!checkoutDir.exists()) {
//	        		checkoutDir.mkdirs(); // 디렉토리 생성
//	            } 
	        	// Release lock
//	        	wcClient.doCleanup(checkoutDir);
	            
	            // update
	            SVNURL url = SVNURL.parseURIEncoded(SVN_URL);
	            updateClient.doCheckout(url, checkoutDir, null, null, SVNDepth.INFINITY, false);
	        } catch (SVNException e) {
	            e.printStackTrace();
	        }
	    }
	 
	 public static void setCommit() {
		 SVNClientManager clientManager = SVNClientManager.newInstance();
	        SVNWCClient wcClient = clientManager.getWCClient();

	        try {
	            File commitDir = new File(CHECKOUT_DIR);

	            // Add all files and directories to the commit
	            wcClient.doAdd(commitDir, true, false, false, SVNDepth.INFINITY, false, false);

	            // Commit the changes
	            SVNCommitClient commitClient = clientManager.getCommitClient();
	            SVNCommitInfo commitInfo = commitClient.doCommit(new File[] {commitDir}, false, "Commit message", null, null, false, false, SVNDepth.INFINITY);

	            System.out.println("SVN commit completed successfully. Revision: " + commitInfo.getNewRevision());
	        } catch (SVNException e) {
	            e.printStackTrace();
	        }
	 }
	 
	 public static void commitChanges(File file) {
		 SVNClientManager clientManager = SVNClientManager.newInstance();
		    SVNWCClient wcClient = clientManager.getWCClient();

		    try {
		        File commitDir = new File(CHECKOUT_DIR);

		        // Delete the file (already done in your servlet)

		        // Remove the deleted file from version control
		        wcClient.doDelete(file, true, false);

		        // Commit the changes
		        SVNCommitClient commitClient = clientManager.getCommitClient();
		        SVNCommitInfo commitInfo = commitClient.doCommit(new File[] {commitDir}, false, "Commit message", null, null, false, false, SVNDepth.INFINITY);

		        System.out.println("SVN commit completed successfully. Revision: " + commitInfo.getNewRevision());
		    } catch (SVNException e) {
		        e.printStackTrace();
		    }
		}
}
