export default (config) => {
    config.set({
        basePath: '../',
        browsers: [
            'Chrome',
            'Firefox', 
            'Opera', 
            'Internet Explorer', 
            'Safari',
        ],
        frameworks: ['jasmine'],
        files: [
            'dist/consistentity.js',
            'tests/test.js',
        ],
        logLevel : config.LOG_INFO,
        port : 9876
    });
};