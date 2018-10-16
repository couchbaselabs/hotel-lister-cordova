package com.hotellister;

import android.content.Context;

import com.couchbase.lite.CouchbaseLiteException;
import com.couchbase.lite.Database;
import com.couchbase.lite.DatabaseConfiguration;
import com.couchbase.lite.FullTextIndex;
import com.couchbase.lite.FullTextIndexItem;
import com.couchbase.lite.IndexBuilder;

// tag::setup-database[]
public class DatabaseManager {

    private static String DB_NAME = "travel-sample";

    private static Database database;
    private static DatabaseManager instance = null;

    private DatabaseManager(Context context) {
        if (!Database.exists("travel-sample", context.getFilesDir())) {
            String assetFile = String.format("%s.cblite2.zip", DB_NAME);
            Utils.installPrebuiltDatabase(context, assetFile);
        }
        DatabaseConfiguration configuration = new DatabaseConfiguration(context);
        try {
            database = new Database(DB_NAME, configuration);
        } catch (CouchbaseLiteException e) {
            e.printStackTrace();
        }
        this.createIndexes();
    }

    private void createIndexes() {
        try {
            FullTextIndexItem item = FullTextIndexItem.property("description");
            FullTextIndex index = IndexBuilder.fullTextIndex(item);
            database.createIndex("descFTSIndex", index);
        } catch (CouchbaseLiteException e) {
            e.printStackTrace();
        }
    }

    public static DatabaseManager getSharedInstance(Context context) {
        if (instance == null) {
            instance = new DatabaseManager(context);
        }
        return instance;
    }

    public static Database getDatabase() {
        if (instance == null) {
            try {
                throw new Exception("Must call getSharedInstance first");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return database;
    }

}
// end::setup-database[]