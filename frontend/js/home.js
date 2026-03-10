// Homepage JavaScript

document.addEventListener('DOMContentLoaded', function() {
    loadPopularPrograms();
    loadStats();
});

/**
 * Load and display hardcoded categories
    // loadCategories() removed since category cards are now statically defined in HTML

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
