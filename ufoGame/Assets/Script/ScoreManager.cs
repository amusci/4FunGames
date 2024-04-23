using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ScoreManager : MonoBehaviour
{
    public Text scoreText;
    private float score;

    // Method to increase the score by a specified amount
    public void IncreaseScore(int amount)
    {
        score += amount;
        UpdateScoreText();
    }

    // Update is called once per frame
    void Update()
    {
        // Check if the player object exists in the scene
        if (GameObject.FindGameObjectWithTag("Player") != null)
        {
            
            
            UpdateScoreText();
        }
    }

    // Update the score text on the UI
    void UpdateScoreText()
    {
        scoreText.text = ((int)score).ToString();
    }
}
