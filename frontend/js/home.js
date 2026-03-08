// Homepage JavaScript

document.addEventListener('DOMContentLoaded', function() {
    loadCategories();
    loadPopularPrograms();
    loadStats();
});

/**
 * Load and display categories
 */
async function loadCategories() {
    const container = document.getElementById('categories-container');
    
    try {
        const categories = await getCategories();
        
        if (categories.length === 0) {
            container.innerHTML = `
                <div class="no-data">
                    <i class="fas fa-inbox"></i>
                    <p>No categories available yet. Check back soon!</p>
                </div>
            `;
            return;
        }

        container.innerHTML = categories.map(category => `
            <div class="category-card" onclick="navigateToCategory(${category.id})">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="${category.iconClass || 'fas fa-folder'}"></i>
                    </div>
                    <h3>${category.name}</h3>
                </div>
                <p>${category.description || 'Explore programs in this category'}</p>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading categories:', error);
        container.innerHTML = `
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                <p>Failed to load categories. Please try again later.</p>
            </div>
        `;
    }
}

/**
 * Load and display popular programs
 */
async function loadPopularPrograms() {
    const container = document.getElementById('popular-programs');
    
    try {
        const programs = await getMostViewedPrograms();
        
        if (programs.length === 0) {
            container.innerHTML = `
                <div class="no-data">
                    <i class="fas fa-inbox"></i>
                    <p>No programs available yet.</p>
                </div>
            `;
            return;
        }

        // Show only first 6 programs
        const displayPrograms = programs.slice(0, 6);
        
        container.innerHTML = displayPrograms.map(program => `
            <div class="program-card" onclick="viewProgram(${program.id})">
                <div class="program-header">
                    <h3>${program.title}</h3>
                    <span class="program-badge badge-${program.difficultyLevel.toLowerCase()}">
                        ${program.difficultyLevel}
                    </span>
                </div>
                <p>${program.description || 'Click to view this program'}</p>
                <div class="program-footer">
                    <span><i class="fas fa-eye"></i> ${program.viewCount} views</span>
                    <span><i class="fas fa-heart"></i> ${program.likesCount} likes</span>
                </div>
            </div>
        `).join('');
    } catch (error) {
        console.error('Error loading popular programs:', error);
        container.innerHTML = `
            <div class="error-message">
                <i class="fas fa-exclamation-triangle"></i>
                <p>Failed to load programs. Please try again later.</p>
            </div>
        `;
    }
}

/**
 * Load statistics
 */
async function loadStats() {
    try {
        const programsCount = await getTotalProgramsCount();
        document.getElementById('total-programs').textContent = programsCount + '+';
    } catch (error) {
        console.error('Error loading stats:', error);
    }
}

/**
 * Navigate to category page
 */
function navigateToCategory(categoryId) {
    window.location.href = 'programs.html';
}

/**
 * View program details
 */
function viewProgram(programId) {
    window.location.href = `program-detail.html?id=${programId}`;
}
