// API Configuration
const API_CONFIG = {
    BASE_URL: 'https://codejamm.onrender.com',
    ENDPOINTS: {
        CATEGORIES: '/api/categories',
        PROGRAMS: '/api/programs',
        TOPICS: '/api/topics',
        COMPILER: '/api/compiler/execute',
        REFERENCES: '/api/references',
        VIDEOS: '/api/videos'
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
