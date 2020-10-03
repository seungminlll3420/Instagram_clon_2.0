package com.csdcorp.local_image_provider;

import java.lang.System;

/**
 * LocalImageProviderPlugin
 */
@kotlin.Metadata(mv = {1, 1, 16}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u00b0\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0015\n\u0002\b\u0004\u0018\u0000 i2\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0001iB\u0005\u00a2\u0006\u0002\u0010\u0005JF\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u001c0\u001b2\u0016\u0010\u001d\u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0016\u0010 \u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0006\u0010!\u001a\u00020\u0011H\u0002J\u0010\u0010\"\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0007H\u0002J\b\u0010%\u001a\u00020#H\u0002J\u0010\u0010&\u001a\u00020\u00112\u0006\u0010\'\u001a\u00020\u000eH\u0002J\u0010\u0010(\u001a\u00020\u00112\u0006\u0010\'\u001a\u00020\u000eH\u0002J \u0010)\u001a\u00020#2\u0006\u0010*\u001a\u00020\u000e2\u0006\u0010+\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0007H\u0002J(\u0010,\u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0006\u0010*\u001a\u00020\u000e2\u0006\u0010-\u001a\u00020.H\u0002JQ\u0010/\u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0006\u0010-\u001a\u00020.2\u0006\u00100\u001a\u0002012\b\u00102\u001a\u0004\u0018\u00010\u000e2\u000e\u00103\u001a\n\u0012\u0004\u0012\u00020\u000e\u0018\u00010\r2\b\u00104\u001a\u0004\u0018\u00010\u000eH\u0002\u00a2\u0006\u0002\u00105JQ\u00106\u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0006\u0010-\u001a\u00020.2\u0006\u00100\u001a\u0002012\b\u00102\u001a\u0004\u0018\u00010\u000e2\u000e\u00103\u001a\n\u0012\u0004\u0012\u00020\u000e\u0018\u00010\r2\b\u00104\u001a\u0004\u0018\u00010\u000eH\u0002\u00a2\u0006\u0002\u00105J(\u00107\u001a\u0012\u0012\u0004\u0012\u00020\u001c0\u001ej\b\u0012\u0004\u0012\u00020\u001c`\u001f2\u0006\u0010*\u001a\u00020\u000e2\u0006\u0010-\u001a\u00020.H\u0002J\u0018\u00108\u001a\u0002092\u0006\u0010:\u001a\u00020\u000e2\u0006\u00100\u001a\u000201H\u0002J\u0018\u0010;\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\u000e2\u0006\u00100\u001a\u000201H\u0002J\u0018\u0010<\u001a\u00020\u00112\u0006\u0010:\u001a\u00020\u000e2\u0006\u00100\u001a\u000201H\u0002J\u0018\u0010=\u001a\u00020#2\u0006\u0010>\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0007H\u0002JK\u0010?\u001a\u0012\u0012\u0004\u0012\u00020@0\u001ej\b\u0012\u0004\u0012\u00020@`\u001f2\u0006\u0010A\u001a\u0002012\f\u0010B\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0006\u00104\u001a\u00020\u000e2\u0006\u0010C\u001a\u00020\u000e2\u0006\u0010:\u001a\u00020\u000eH\u0002\u00a2\u0006\u0002\u0010DJ(\u0010E\u001a\u00020#2\u0006\u0010\'\u001a\u00020\u000e2\u0006\u0010F\u001a\u00020\u00112\u0006\u0010G\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0007H\u0002J\u0018\u0010H\u001a\u00020#2\u0006\u0010!\u001a\u00020\u00112\u0006\u0010$\u001a\u00020\u0007H\u0002J\u0018\u0010I\u001a\u00020#2\u0006\u0010\'\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u0007H\u0002J\u0010\u0010J\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0007H\u0002J\u0010\u0010K\u001a\u00020#2\u0006\u0010$\u001a\u00020\u0007H\u0002J\u0012\u0010L\u001a\u00020#2\b\u0010M\u001a\u0004\u0018\u00010\u0018H\u0002J\u0010\u0010N\u001a\u00020\u00132\u0006\u0010$\u001a\u00020\u0007H\u0002J&\u0010O\u001a\u0012\u0012\u0004\u0012\u00020\u000e0\u001ej\b\u0012\u0004\u0012\u00020\u000e`\u001f2\f\u0010P\u001a\b\u0012\u0004\u0012\u00020\u001c0\u001bH\u0002J\u0010\u0010Q\u001a\u00020#2\u0006\u0010R\u001a\u00020SH\u0016J\u0018\u0010T\u001a\u00020#2\u0006\u0010U\u001a\u00020\u00182\u0006\u0010V\u001a\u00020WH\u0002J\u0012\u0010T\u001a\u00020#2\b\b\u0001\u0010X\u001a\u00020YH\u0016J\b\u0010Z\u001a\u00020#H\u0016J\b\u0010[\u001a\u00020#H\u0016J\u0012\u0010\\\u001a\u00020#2\b\b\u0001\u0010R\u001a\u00020YH\u0016J\u001c\u0010]\u001a\u00020#2\b\b\u0001\u0010^\u001a\u00020_2\b\b\u0001\u0010`\u001a\u00020\u0007H\u0016J\u0010\u0010a\u001a\u00020#2\u0006\u0010R\u001a\u00020SH\u0016J1\u0010b\u001a\u00020\u00132\u0006\u0010c\u001a\u00020\u00112\u0010\u0010d\u001a\f\u0012\u0006\b\u0001\u0012\u00020\u000e\u0018\u00010\r2\b\u0010e\u001a\u0004\u0018\u00010fH\u0016\u00a2\u0006\u0002\u0010gJ\u0010\u0010h\u001a\u00020\u00132\u0006\u0010$\u001a\u00020\u0007H\u0002R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082.\u00a2\u0006\u0002\n\u0000R\u0010\u0010\n\u001a\u0004\u0018\u00010\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000fR\u000e\u0010\u0010\u001a\u00020\u0011X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u000eX\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\u0011X\u0082D\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0017\u001a\u0004\u0018\u00010\u0018X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000f\u00a8\u0006j"}, d2 = {"Lcom/csdcorp/local_image_provider/LocalImageProviderPlugin;", "Lio/flutter/embedding/engine/plugins/FlutterPlugin;", "Lio/flutter/plugin/common/MethodChannel$MethodCallHandler;", "Lio/flutter/plugin/common/PluginRegistry$RequestPermissionsResultListener;", "Lio/flutter/embedding/engine/plugins/activity/ActivityAware;", "()V", "activeResult", "Lio/flutter/plugin/common/MethodChannel$Result;", "channel", "Lio/flutter/plugin/common/MethodChannel;", "currentActivity", "Landroid/app/Activity;", "imageColumns", "", "", "[Ljava/lang/String;", "imagePermissionCode", "", "initializedSuccessfully", "", "logTag", "minSdkForImageSupport", "permissionGranted", "pluginContext", "Landroid/content/Context;", "videoColumns", "chooseLatest", "", "Lcom/csdcorp/local_image_provider/MediaAsset;", "images", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "videos", "maxResults", "cleanup", "", "result", "completeInitialize", "countAlbumImages", "id", "countAlbumVideos", "findAlbumImages", "albumId", "maxImages", "findImagesInAlbum", "mediaResolver", "Landroid/content/ContentResolver;", "findImagesToMedia", "imgUri", "Landroid/net/Uri;", "selection", "selectionArgs", "sortOrder", "(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;", "findVideoToMedia", "findVideosInAlbum", "getAlbumCoverImage", "Lorg/json/JSONObject;", "bucketId", "getAlbumImageCount", "getAlbumVideoCount", "getAlbums", "localAlbumType", "getAlbumsFromLocation", "Lcom/csdcorp/local_image_provider/Album;", "contentUri", "mediaColumns", "bucketDisplayName", "(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/ArrayList;", "getImageBytes", "width", "height", "getLatestImages", "getVideoFile", "hasPermission", "initialize", "initializeIfPermitted", "context", "isNotInitialized", "mediaToJson", "media", "onAttachedToActivity", "binding", "Lio/flutter/embedding/engine/plugins/activity/ActivityPluginBinding;", "onAttachedToEngine", "applicationContext", "messenger", "Lio/flutter/plugin/common/BinaryMessenger;", "flutterPluginBinding", "Lio/flutter/embedding/engine/plugins/FlutterPlugin$FlutterPluginBinding;", "onDetachedFromActivity", "onDetachedFromActivityForConfigChanges", "onDetachedFromEngine", "onMethodCall", "call", "Lio/flutter/plugin/common/MethodCall;", "rawResult", "onReattachedToActivityForConfigChanges", "onRequestPermissionsResult", "requestCode", "permissions", "grantResults", "", "(I[Ljava/lang/String;[I)Z", "sdkVersionTooLow", "Companion", "local_image_provider_debug"})
public final class LocalImageProviderPlugin implements io.flutter.embedding.engine.plugins.FlutterPlugin, io.flutter.plugin.common.MethodChannel.MethodCallHandler, io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener, io.flutter.embedding.engine.plugins.activity.ActivityAware {
    private android.content.Context pluginContext;
    private android.app.Activity currentActivity;
    private final int minSdkForImageSupport = 8;
    private final int imagePermissionCode = 34264;
    private io.flutter.plugin.common.MethodChannel.Result activeResult;
    private boolean initializedSuccessfully = false;
    private boolean permissionGranted = false;
    private final java.lang.String logTag = "LocalImageProvider";
    private final java.lang.String[] imageColumns = {"_display_name", "datetaken", "title", "height", "width", "_size", "_id"};
    private final java.lang.String[] videoColumns = {"_display_name", "datetaken", "title", "height", "width", "_size", "_id"};
    private io.flutter.plugin.common.MethodChannel channel;
    public static final com.csdcorp.local_image_provider.LocalImageProviderPlugin.Companion Companion = null;
    
    @java.lang.Override()
    public void onAttachedToEngine(@org.jetbrains.annotations.NotNull()
    @androidx.annotation.NonNull()
    io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding flutterPluginBinding) {
    }
    
    private final void onAttachedToEngine(android.content.Context applicationContext, io.flutter.plugin.common.BinaryMessenger messenger) {
    }
    
    @java.lang.Override()
    public void onDetachedFromEngine(@org.jetbrains.annotations.NotNull()
    @androidx.annotation.NonNull()
    io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding binding) {
    }
    
    @java.lang.Override()
    public void onDetachedFromActivity() {
    }
    
    @java.lang.Override()
    public void onReattachedToActivityForConfigChanges(@org.jetbrains.annotations.NotNull()
    io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding binding) {
    }
    
    @java.lang.Override()
    public void onAttachedToActivity(@org.jetbrains.annotations.NotNull()
    io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding binding) {
    }
    
    @java.lang.Override()
    public void onDetachedFromActivityForConfigChanges() {
    }
    
    @java.lang.Override()
    public void onMethodCall(@org.jetbrains.annotations.NotNull()
    @androidx.annotation.NonNull()
    io.flutter.plugin.common.MethodCall call, @org.jetbrains.annotations.NotNull()
    @androidx.annotation.NonNull()
    io.flutter.plugin.common.MethodChannel.Result rawResult) {
    }
    
    private final void hasPermission(io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final void initialize(io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final boolean sdkVersionTooLow(io.flutter.plugin.common.MethodChannel.Result result) {
        return false;
    }
    
    private final boolean isNotInitialized(io.flutter.plugin.common.MethodChannel.Result result) {
        return false;
    }
    
    private final void getAlbums(int localAlbumType, io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final java.util.ArrayList<com.csdcorp.local_image_provider.Album> getAlbumsFromLocation(android.net.Uri contentUri, java.lang.String[] mediaColumns, java.lang.String sortOrder, java.lang.String bucketDisplayName, java.lang.String bucketId) {
        return null;
    }
    
    private final org.json.JSONObject getAlbumCoverImage(java.lang.String bucketId, android.net.Uri imgUri) {
        return null;
    }
    
    private final int countAlbumImages(java.lang.String id) {
        return 0;
    }
    
    private final int countAlbumVideos(java.lang.String id) {
        return 0;
    }
    
    private final int getAlbumImageCount(java.lang.String bucketId, android.net.Uri imgUri) {
        return 0;
    }
    
    private final int getAlbumVideoCount(java.lang.String bucketId, android.net.Uri imgUri) {
        return 0;
    }
    
    private final void getLatestImages(int maxResults, io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final java.util.List<com.csdcorp.local_image_provider.MediaAsset> chooseLatest(java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> images, java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> videos, int maxResults) {
        return null;
    }
    
    private final void findAlbumImages(java.lang.String albumId, int maxImages, io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> findImagesInAlbum(java.lang.String albumId, android.content.ContentResolver mediaResolver) {
        return null;
    }
    
    private final java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> findVideosInAlbum(java.lang.String albumId, android.content.ContentResolver mediaResolver) {
        return null;
    }
    
    private final java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> findImagesToMedia(android.content.ContentResolver mediaResolver, android.net.Uri imgUri, java.lang.String selection, java.lang.String[] selectionArgs, java.lang.String sortOrder) {
        return null;
    }
    
    private final java.util.ArrayList<com.csdcorp.local_image_provider.MediaAsset> findVideoToMedia(android.content.ContentResolver mediaResolver, android.net.Uri imgUri, java.lang.String selection, java.lang.String[] selectionArgs, java.lang.String sortOrder) {
        return null;
    }
    
    private final java.util.ArrayList<java.lang.String> mediaToJson(java.util.List<com.csdcorp.local_image_provider.MediaAsset> media) {
        return null;
    }
    
    private final void getVideoFile(java.lang.String id, io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final void cleanup(io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final void getImageBytes(java.lang.String id, int width, int height, io.flutter.plugin.common.MethodChannel.Result result) {
    }
    
    private final void initializeIfPermitted(android.content.Context context) {
    }
    
    private final void completeInitialize() {
    }
    
    @java.lang.Override()
    public boolean onRequestPermissionsResult(int requestCode, @org.jetbrains.annotations.Nullable()
    java.lang.String[] permissions, @org.jetbrains.annotations.Nullable()
    int[] grantResults) {
        return false;
    }
    
    public LocalImageProviderPlugin() {
        super();
    }
    
    public static final void registerWith(@org.jetbrains.annotations.NotNull()
    io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
    }
    
    @kotlin.Metadata(mv = {1, 1, 16}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002\u00a2\u0006\u0002\u0010\u0002J\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0007\u00a8\u0006\u0007"}, d2 = {"Lcom/csdcorp/local_image_provider/LocalImageProviderPlugin$Companion;", "", "()V", "registerWith", "", "registrar", "Lio/flutter/plugin/common/PluginRegistry$Registrar;", "local_image_provider_debug"})
    public static final class Companion {
        
        public final void registerWith(@org.jetbrains.annotations.NotNull()
        io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
        }
        
        private Companion() {
            super();
        }
    }
}