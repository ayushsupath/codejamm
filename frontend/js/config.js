// API Configuration
const API_CONFIG = {
    BASE_URL: 'http://localhost:8080/api',
    ENDPOINTS: {
        CATEGORIES: '/categories',
        PROGRAMS: '/programs',
        TOPICS: '/topics',
        COMPILER: '/compiler/execute',
        REFERENCES: '/references',
        VIDEOS: '/videos'
    }
};

// Helper function to build full API URL
function getApiUrl(endpoint) {
    return API_CONFIG.BASE_URL + endpoint;
}

// Export for use in other files
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { API_CONFIG, getApiUrl };
}
